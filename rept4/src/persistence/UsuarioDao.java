package persistence;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Usuario;

public class UsuarioDao extends Dao {

	public void create(Usuario p) throws Exception {

		open();

		pstmt = con
				.prepareStatement("INSERT INTO usuario(usuario_nome_fb) VALUES(?)");
		// stmt.setString(1, p.getUsuario_id_fb());
		pstmt.setString(1, p.getUsuario_nome_fb());
		// stmt.setString(3, p.getUsuario_username_fb());

		pstmt.execute();
		close();
	}

	public List<Usuario> listar() throws Exception {
		
		List<Usuario> usuarios = new ArrayList<Usuario>();
		try {
			open();
			String sql = "SELECT usuario_nome_fb FROM usuario";
			//con.createStatement();
			pstmt = con.prepareStatement(sql);
			//pstmt.setString(1,"");
			pstmt.execute();
			
			rs = pstmt.getResultSet();

			while (rs.next()) {
				Usuario user = new Usuario();
				user.setUsuario_nome_fb(rs.getString("usuario_nome_fb"));
				usuarios.add(user);
				// System.out.println("entrou aqui");
			}

		} catch (SQLException e) {
			System.out.println("erro listar:" + e);
		}
		return usuarios;
	}
}
