/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidadesTemporarias;

import br.com.persistor.generalClasses.PersistenceLog;
import br.com.persistor.interfaces.Session;
import entidades.Veiculos;
import java.util.ArrayList;
import java.util.List;
import logging.PersistenceLoggerImpl;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
public class VeiculosImgCache
{

    private static VeiculosImgCache instance;

    public static VeiculosImgCache getInstance()
    {
        if (instance == null)
            instance = new VeiculosImgCache();

        return instance;
    }

    private List<Veiculos> veiculos = null;

    private VeiculosImgCache()
    {
        veiculos = new ArrayList<Veiculos>();
    }

    public Veiculos find(int id)
    {
        PersistenceLoggerImpl pl = new PersistenceLoggerImpl();
        pl.newNofication(new PersistenceLog("VeiculosImg", "VCon", null, "Carregou do cache", "Carregou do cache"));

        for (Veiculos veiculo : veiculos)
            if (veiculo.getId() == id)
                return veiculo;

        return null;
    }

    public void add(Veiculos veiculo)
    {
        veiculos.add(veiculo);
    }

    public void remove(int id)
    {
        for (Veiculos veiculo : veiculos)
            if (veiculo.getId() == id)
            {
                veiculos.remove(veiculo);
                break;
            }
    }

    public void update(Veiculos veiculo)
    {
        remove(veiculo.getId());
        add(veiculo);
    }

}
