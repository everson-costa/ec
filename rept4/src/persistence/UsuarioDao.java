package persistence;

import java.util.ArrayList;

import model.Usuario;

public class UsuarioDao extends Dao {

	public void create(Usuario p) throws Exception {

		open();

		stmt = con
				.prepareStatement("INSERT INTO usuario(usuario_id_fb, usuario_nome_fb, usuario_username_fb) VALUES(?,?,?)");

		stmt.setString(1, p.getUsuario_id_fb());
		stmt.setString(2, p.getUsuario_nome_fb());
		stmt.setString(3, p.getUsuario_username_fb());

		stmt.execute();
		close();
	}

	public ArrayList<Usuario> listar() throws Exception {
		ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
		String sql = "SELECT usuario_id_fb FROM usuario";
		try {
			open();

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Usuario user = new Usuario();
				user.setUsuario_id_fb("usuario_id_fb");
				listaUsuarios.add(user);
				System.out.println("entrou aqui");
			}

		} catch (Exception e) {
			System.out.println("erro listar:"+e);
		}
		return listaUsuarios;
	}
}
