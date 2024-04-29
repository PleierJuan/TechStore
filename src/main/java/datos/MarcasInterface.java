
package datos;

import beanDTO.MarcasDTO;
import java.util.List;

public interface MarcasInterface {
    public int insertaMarcas(MarcasDTO marca);
    public List<MarcasDTO> consultarMarcas(); 
    public int deletearMarcas(MarcasDTO marca);
    public int updatearMarcas(MarcasDTO marca);
    public MarcasDTO consultaNombreMarca(int idMarca);
}
