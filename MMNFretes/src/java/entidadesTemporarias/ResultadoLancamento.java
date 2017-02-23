/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidadesTemporarias;

import entidades.Oportunidades;
import entidades.Veiculos;
import java.util.List;

/**
 *
 * @author Marcos Vinícius
 */
public class ResultadoLancamento
{

    private Oportunidades oportunidades;
    private List<Veiculos> veiculos;

    public ResultadoLancamento(Oportunidades o, List<Veiculos> v)
    {
        this.oportunidades = o;
        this.veiculos = v;
    }

    public Oportunidades getOportunidades()
    {
        return oportunidades;
    }

    public void setOportunidades(Oportunidades oportunidades)
    {
        this.oportunidades = oportunidades;
    }

    public List<Veiculos> getVeiculos()
    {
        return veiculos;
    }

    public void setVeiculos(List<Veiculos> veiculos)
    {
        this.veiculos = veiculos;
    }
}
