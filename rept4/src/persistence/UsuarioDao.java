package persistence;

import model.Usuario;

public class UsuarioDao extends Dao{
	
	public void create(Usuario p)throws Exception{  
        
	      open();  
	        
	      stmt = con.prepareStatement("INSERT INTO usuario(usuario_id_fb, usuario_nome_fb, usuario_username_fb) VALUES(?,?,?)");  
	        
	      stmt.setString(1, p.getUsuario_id_fb());  
	      stmt.setString(2, p.getUsuario_nome_fb());  
	      stmt.setString(3, p.getUsuario_username_fb());  
	        
	      stmt.execute();        
	      close();        
	   }     


}
