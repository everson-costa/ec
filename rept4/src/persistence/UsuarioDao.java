package persistence;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Request;

import model.Usuario;

public class UsuarioDao extends Dao {
	
	boolean idrepete = false;
	
	public void create(Usuario p) throws Exception {

		open();
		String testaId = p.getUsuario_id_fb();

		if (verificaIDexistente(testaId)) {
			close();
			idrepete = true;
		} else {
			pstmt = con.prepareStatement("INSERT INTO usuario(usuario_id_fb,usuario_nome_fb,usuario_username_fb) VALUES(?,?,?)");
			pstmt.setString(1, p.getUsuario_id_fb());
			pstmt.setString(2, p.getUsuario_nome_fb());
			pstmt.setString(3, p.getUsuario_username_fb());
			pstmt.execute();
			close();
		}
   
	}

	public List<Usuario> listar(String valp) throws Exception {
		
		List<Usuario> usuarios = new ArrayList<Usuario>();
		
		try {
			open();
			String sql = "select usuario_id_fb,usuario_nome_fb,usuario_username_fb from test.usuario" +
					" where usuario_nome_fb like ? or usuario_username_fb like ? order by usuario_id_fb asc;";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + valp + "%");
			pstmt.setString(2, "%" + valp + "%");
			rs = pstmt.executeQuery();
			

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
	
public boolean verificaIDexistente(String testaIdFb) throws Exception {
		boolean existeID = false;
		List<Usuario> usuarios = new ArrayList<Usuario>();
		
		try {
			open();
			String sql = "SELECT usuario_id_fb FROM usuario;";
			//con.createStatement();
			pstmt = con.prepareStatement(sql);
			pstmt.execute();
			
			rs = pstmt.getResultSet();

			while (rs.next()) {
				
				Usuario user = new Usuario();
				String usidfb = rs.getString("usuario_id_fb");
				user.setUsuario_id_fb(usidfb);
				usuarios.add(user);
								
				if(user.getUsuario_id_fb().contains(testaIdFb)){
					//System.out.println("ja existe um registro na tabela usuario com o id: "+testaIdFb);
					existeID = true;
					
				}
			}

		} catch (SQLException e) {
			System.out.println("erro listar:" + e);
		}
		//System.out.println("verificacao retornou: "+existeID);
		return existeID;
	}

	public boolean checaIDrepet() {

		if (idrepete == true) {
			return true;
		} else {
			return false;
		}

	}
	
	public List<Usuario> pegaPerfil(String idfb) throws Exception {
		List<Usuario> perfil = new ArrayList<Usuario>();

		try {
			open();

			String sql = "select usuario_id_fb,usuario_nome_fb,usuario_username_fb from test.usuario" +
					" where usuario_id_fb like ?;";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idfb);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Usuario user = new Usuario();
				String usidfb = rs.getString("usuario_id_fb");
				String nome = rs.getString("usuario_nome_fb");
				String usernamefb = rs.getString("usuario_username_fb");
				
				user.setUsuario_id_fb(usidfb);
				user.setUsuario_nome_fb(nome);
				user.setUsuario_username_fb(usernamefb);
				user.setUsuario_id_fb(usidfb);
				perfil.add(user);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return perfil;

	}
	
	
	
	
}
