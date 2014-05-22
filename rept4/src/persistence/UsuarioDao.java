package persistence;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Usuario;

public class UsuarioDao extends Dao {

	public void create(Usuario p) throws Exception {

		open();

		pstmt = con
				.prepareStatement("INSERT INTO usuario(usuario_id_fb,usuario_nome_fb,usuario_username_fb) VALUES(?,?,?)");
		
//		INSERT INTO test.usuario (usuario_id_fb)
//		SELECT * FROM (SELECT '333858585') as temp
//		WHERE NOT EXISTS (
//		    SELECT * FROM test.usuario WHERE usuario_id_fb = '333858585'
//		) LIMIT 1;
		
		
		// stmt.setString(1, p.getUsuario_id_fb());
		pstmt.setString(1, p.getUsuario_id_fb());
		pstmt.setString(2, p.getUsuario_nome_fb());
		pstmt.setString(3, p.getUsuario_username_fb());
		// stmt.setString(3, p.getUsuario_username_fb());

		pstmt.execute();
		close();
	}

	public List<Usuario> listar() throws Exception {
		
		List<Usuario> usuarios = new ArrayList<Usuario>();
		try {
			open();
			String sql = "SELECT usuario_id_fb, usuario_nome_fb,usuario_username_fb FROM usuario;";
			//con.createStatement();
			pstmt = con.prepareStatement(sql);
			pstmt.execute();
			
			rs = pstmt.getResultSet();

			while (rs.next()) {
				
				Usuario user = new Usuario();
				String usidfb = rs.getString("usuario_id_fb");
				String nome = rs.getString("usuario_nome_fb");
				String usernamefb = rs.getString("usuario_username_fb");
				
				user.setUsuario_id_fb(usidfb);
				user.setUsuario_nome_fb(nome);
				user.setUsuario_username_fb(usernamefb);
				
				usuarios.add(user);
				
			}

		} catch (SQLException e) {
			System.out.println("erro listar:" + e);
		}
		return usuarios;
	}
}
