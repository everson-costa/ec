package persistence;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


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
			
			CallableStatement cstmt = con.prepareCall("{call criaperfil(?)}");
			
			pstmt = con.prepareStatement("INSERT INTO usuario(usuario_id_fb,usuario_nome_fb,usuario_username_fb) VALUES(?,?,?)");
			pstmt.setString(1, p.getUsuario_id_fb());
			pstmt.setString(2, p.getUsuario_nome_fb());
			pstmt.setString(3, p.getUsuario_username_fb());
			pstmt.execute();
			
			cstmt.setString(1,p.getUsuario_id_fb());
			
			rs = cstmt.executeQuery();
			
			close();
		}
   
	}

	public List<Usuario> listar(String valp) throws Exception {
		
		List<Usuario> usuarios = new ArrayList<Usuario>();
		System.out.println("select like:"+valp);
		
		try {
			open();
			
			String sql = "select u.usuario_id_fb,u.usuario_nome_fb,u.usuario_username_fb,p.ratio from test.usuario as u" +
					" join test.perfil as p on u.usuario_id_fb = p.usidfb" +
					" where u.usuario_nome_fb like ? or u.usuario_username_fb like ? order by u.usuario_nome_fb asc, u.usuario_username_fb asc;";
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + valp + "%");
			pstmt.setString(2, "%" + valp + "%");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				Usuario user = new Usuario();
				String usidfb = rs.getString("u.usuario_id_fb");
				String nome = rs.getString("u.usuario_nome_fb");
				String usernamefb = rs.getString("u.usuario_username_fb");
				String ratio = rs.getString("p.ratio");
				System.out.println(" id:"+usidfb+" nome:"+nome+" usr:"+usernamefb+" ratio:"+ratio);
				
				user.setUsuario_id_fb(usidfb);
				user.setUsuario_nome_fb(nome);
				user.setUsuario_username_fb(usernamefb);
				user.setRatio(Float.parseFloat(ratio));
				
				usuarios.add(user);
				System.out.println("passou while");
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

			String sql = "select u.usuario_id_fb,u.usuario_nome_fb,u.usuario_username_fb,p.ratio from test.usuario as u" +
					" join test.perfil as p on u.usuario_id_fb = p.usidfb" +
					" where u.usuario_id_fb like ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idfb);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Usuario user = new Usuario();
				String usidfb = rs.getString("u.usuario_id_fb");
				String nome = rs.getString("u.usuario_nome_fb");
				String usernamefb = rs.getString("u.usuario_username_fb");
				String ratio = rs.getString("p.ratio");
				
				user.setUsuario_id_fb(usidfb);
				user.setUsuario_nome_fb(nome);
				user.setUsuario_username_fb(usernamefb);
				user.setUsuario_id_fb(usidfb);
				user.setRatio(Float.parseFloat(ratio));
				perfil.add(user);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return perfil;

	}
	
	
	
	
}
