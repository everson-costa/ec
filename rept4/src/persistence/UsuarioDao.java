package persistence;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.ResultSet;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

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
	
	public ArrayList<Usuario> cnt(String cntusuario) throws Exception{
		
		open();

		 String sql = "SELECT usuario_if_fb FROM produto WHERE usuario=?";

		 PreparedStatement  pstmt = con.prepareStatement(sql);
		 pstmt.setString(1, cntusuario);

		 Usuario u = null;
		 ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
		 stmt.executeQuery();

		 while(rs.next()){
		  u = new Usuario();
		  u.setUsuario_id_fb(rs.getString("usuario_id_fb")); //Para isso, terá que criar o método na classe Produto
		  listaUsuarios.add(u);
		 }
		 
		 return listaUsuarios;
		}
	
	
}
//teste subindo pelo prpduz
//teste subindo pelo prpduz
//teste subindo pelo prpduz
//teste subindo pelo prpduz
//teste subindo pelo prpduz
//teste subindo pelo prpduz
//teste subindo pelo prpduz
//teste subindo pelo prpduz
//teste subindo pelo prpduz
//teste subindo pelo prpduz