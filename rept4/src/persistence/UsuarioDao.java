package persistence;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import model.Usuario;

public class UsuarioDao extends Dao {

	public void create(Usuario p) throws Exception {

		open();

		stmt = con.prepareStatement("INSERT INTO usuario(usuario_id_fb, usuario_nome_fb, usuario_username_fb) VALUES(?,?,?)");
		//stmt.setString(1, p.getUsuario_id_fb());
		stmt.setString(2, p.getUsuario_nome_fb());
		//stmt.setString(3, p.getUsuario_username_fb());

		stmt.execute();
		close();
	}

	   public List<Usuario> listar() {
	     List<Usuario> usuarios = new ArrayList<Usuario>();
		try { 
			
		String sql = "SELECT usuario_nome_fb FROM usuario;";
		
		rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				Usuario user = new Usuario();
				user.setUsuario_nome_fb(rs.getString("usuario_nome_fb"));
				usuarios.add(user);
				//System.out.println("entrou aqui");
			}

		} catch (Exception e) {
			System.out.println("erro listar:" + e);
		}
		return usuarios;
	}
}
