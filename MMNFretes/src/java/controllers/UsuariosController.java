/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.interfaces.Session;
import com.google.gson.Gson;
import entidades.Categorias_veiculos;
import entidades.Historico;
import entidades.Pedidos_vendas;
import entidades.Tipos_carga;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
import entidadesTemporarias.UsuarioPainelAdmin;
import enums.CATEGORIA_VEICULO;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;
import util.Util;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
@Scope(value = "request")
public class UsuariosController
{

    @RequestMapping(value = "/cadastrausuario", method = RequestMethod.POST)
    public ModelAndView gravaUsuario(Usuarios usuario, HttpSession httpSession)
    {
        if (usuarioExiste(usuario))
        {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("usuarioExiste", true);
            return mav;
        }

        usuario.setTipo_usuario(0);

        Session session = SessionProvider.openSession();
        session.save(usuario);
        session.commit();
        session.close();

        httpSession.setAttribute("usuarioLogado", usuario);

        return new ModelAndView("redirect:areausuario");
    }

    @RequestMapping(value = "/cadastratransportadora", method = RequestMethod.POST)
    public ModelAndView gravaTransportadora(Transportadoras transportadoras, HttpSession httpSession)
    {
        if (usuarioExiste(transportadoras.getUsuarios()))
        {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("usuarioExiste", true);
            return mav;
        }

        transportadoras.getUsuarios().setTipo_usuario(1);
        transportadoras.getUsuarios().setNome(transportadoras.getNome());

        Session session = SessionProvider.openSession();
        session.save(transportadoras);
        session.commit();
        session.close();

        httpSession.setAttribute("usuarioLogado", transportadoras.getUsuarios());

        return new ModelAndView("redirect:areatransportador");
    }

    /**
     * Para verificar se existe mais de uma pessoa com o mesmo email
     *
     * @param usuario
     * @return
     */
    private boolean usuarioExiste(Usuarios usuario)
    {
        Session session = SessionProvider.openSession();
        session.createCriteria(usuario, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "email", usuario.getEmail()))
                .execute();
        session.close();

        return (usuario.ResultList.size() > 0); // se for maior que 0, existe
    }

    @RequestMapping(value = "/alteraInfoUsuario", method = RequestMethod.POST)
    public @ResponseBody
    String alteraInfoUsuario(Usuarios usuario, HttpSession httpSession)
    {
        if (usuario.getNome().equals("undefined"))
            return "";

        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        usuario.setId(usuarioLogado.getId());

        Session session = SessionProvider.openSession();
        session.update(usuario);
        session.commit();
        session.close();

        return "infoUsuario";
    }

    @RequestMapping(value = "tipo_usuario")
    public @ResponseBody
    String getTipoUsuario(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");

        if (usuario == null)
            return "-1";

        return (Util.isUsuario(usuario)
                ? "0"
                : "1");
    }

    @RequestMapping(value = "/infoUsuario", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    public @ResponseBody
    String infoUsuario(HttpSession httpSession, HttpServletResponse response)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");

        Session session = SessionProvider.openSession();
        usuario = session.onID(Usuarios.class, usuario.getId());
        session.close();

        Gson gson = new Gson();
        String resultado = gson.toJson(usuario);
        return resultado;
    }

    @RequestMapping(value = "/usuarioatual", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
    public @ResponseBody
    String getUsuarioAtual(HttpSession session)
    {
        Usuarios usuario = (Usuarios) session.getAttribute("usuarioLogado");
        return (usuario == null
                ? "0"
                : usuario.getId() + "");
    }

    @RequestMapping(value = "/paginaperfil")
    public String paginaPerfil(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");

        if (usuario.isAdmin())
            return "redirect:admin";

        if (Util.isUsuario(usuario))
            return "redirect:areausuario";
        else
            return "redirect:areatransportador";
    }

    @RequestMapping("/areausuario")
    public String redirecionaAreaUsuario(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");

        if (Util.isUsuario(usuario))
            return "areausuario";
        else
            return "redirect:paginalogin";
    }

    @RequestMapping("/loggout")
    public String loggout(HttpSession httpSession)
    {
        httpSession.setAttribute("usuarioLogado", null);
        return "redirect:pesquisar";
    }
    
    @RequestMapping(value = "/listaUsuariosAdmin")
    public ModelAndView listaUsuariosAdmin()
    {
        Usuarios usuarios = new Usuarios();
        Session session = SessionProvider.openSession();
        session.createQuery(usuarios, "select * from usuarios where admin = false")
                .setResult_type(RESULT_TYPE.MULTIPLE)
                .execute();

        List<UsuarioPainelAdmin> result = new ArrayList<UsuarioPainelAdmin>();
        List<Usuarios> list = usuarios.toList();

        for (Usuarios usuario : list)
            result.add(new UsuarioPainelAdmin(
                    usuario, getTotalDebitoUsuario(usuario, session)));

        session.close();
        ModelAndView mav = new ModelAndView("listausuarios-admin");
        mav.addObject("usuarios", result);
        return mav;
    }

    private double getTotalDebitoUsuario(Usuarios usuario, Session session)
    {
        Transportadoras transportadora = (usuario.getTipo_usuario() == 1
                ? new TransportadorasController().getByUsuario(usuario.getId())
                : null);
        
        Calendar calendar = Calendar.getInstance();
        Date dataInicio = br.com.persistor.generalClasses.Util.getDate(1, calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.YEAR));
        Date dataFim = br.com.persistor.generalClasses.Util.getDate(calendar.getActualMaximum(Calendar.DATE), calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.YEAR));
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        double totalFaturamentoUsuario = (usuario.getTipo_usuario() == 1 //Transportador
                ? session.sum(Historico.class, "valor",
                        "transportadoras_id = " + transportadora.getId() + " and data between '" + dateFormat.format(dataInicio) + "' and '" + dateFormat.format(dataFim) + "'")
                : session.sum(Pedidos_vendas.class, "valor_final",
                        "usuario_vendedor = " + usuario.getId() + " and data between '" + dateFormat.format(dataInicio) + "' and '" + dateFormat.format(dataFim) + "' and status = 4"));

        if (totalFaturamentoUsuario == 0)
            return 0;
        if (usuario.getTipo_usuario() == 1)
            return getTotalDebitoTransportadora(transportadora,
                    totalFaturamentoUsuario);
        else
            return (totalFaturamentoUsuario / 100 * 10);
    }

    private double getTotalDebitoTransportadora(Transportadoras transportadora,
            double totalFaturado)
    {
        return (transportadora.getModelo_pagamento() == 0
                ? getTotalPlanoParticipativo(transportadora, totalFaturado)
                : getTotalPlanoMensal(transportadora));
    }

    private double getTotalPlanoParticipativo(Transportadoras transportadora, double totalFaturado)
    {
        return (totalFaturado / 100 * 5);
    }

    private double getTotalPlanoMensal(Transportadoras transportadora)
    {
        double total = 0;
        List<Veiculos> veiculos = transportadora.getVeiculos().toList();
        for (Veiculos veiculo : veiculos)
            switch (veiculo.getCategorias_veiculos_id())
            {
                case CATEGORIA_VEICULO.TOCO:
                    total += 1;
                    break;
                case CATEGORIA_VEICULO.TRES_QUATRO:
                    total += 1;
                    break;
                case CATEGORIA_VEICULO.VLC:
                    total += 0.50;
                    break;
                case CATEGORIA_VEICULO.VUC:
                    total += 0.50;
                    break;
                case CATEGORIA_VEICULO.TRUCK:
                    total += 2;
                    break;
                case CATEGORIA_VEICULO.BITRUCK:
                    total += 2;
                    break;
                case CATEGORIA_VEICULO.RODOTREM:
                    total += 5;
                    break;
                case CATEGORIA_VEICULO.BITREM:
                    total += 5;
                    break;
                case CATEGORIA_VEICULO.CARRETA_LS:
                    total += 4;
                    break;
                case CATEGORIA_VEICULO.CARRETA:
                    total += 4;
                    break;
                default:
                    break;
            }

        return total;
    }
}
