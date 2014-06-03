package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.UsuarioDao;

@WebServlet("/LoadProfile")
public class LoadProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// private UsuarioDao dao;

	public LoadProfile() {
		super();

	}

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String idperfil = request.getParameter("loadperfil");
		//System.out.println("pega o perfil"+idperfil);
		if (idperfil.equalsIgnoreCase("") ||  //não permite pesquisar usando campo em branco, 1espaço, null, . , menor 2 caracteres
				idperfil == null ||
						idperfil.equalsIgnoreCase(" ") ||
				idperfil.equalsIgnoreCase(".") ||
				idperfil.length()<=2) {
			request.getRequestDispatcher("WEB-INF/jsps/valpesquisavazio.jsp").forward(request, response);
			System.out.println("vazio o campo informado");
		} else {
			try {
				UsuarioDao usdao = new UsuarioDao();
				request.setAttribute("usuario_id_fb", usdao.pegaPerfil(idperfil));
				request.setAttribute("usuario_nome_fb",usdao.pegaPerfil(idperfil));
				request.setAttribute("usuario_username_fb",usdao.pegaPerfil(idperfil));
				request.setAttribute("ratio",usdao.pegaPerfil(idperfil));
				
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsps/perfil.jsp");
				view.forward(request, response);

			} catch (Exception e) {
				request.setAttribute("msg", "Erro get: " + e.getMessage());
				request.getRequestDispatcher("WEB-INF/jsps/erro.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {

		} catch (Exception e) {
			request.setAttribute("msg", "Erro: " + e.getMessage());
			request.getRequestDispatcher("WEB-INF/jsps/index.jsp").forward(
					request, response);
		}
	}
}