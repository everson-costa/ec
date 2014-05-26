package control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.UsuarioDao;

@WebServlet("/CntUser")
public class CntUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// private UsuarioDao dao;

	public CntUser() {
		super();

	}

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String valpesquisa = request.getParameter("vpesq"); //não permite pesquisar usando campo em branco, 1espaço, null, . , menoS 2 caracteres 
		if (valpesquisa.equalsIgnoreCase("") ||
				valpesquisa == null ||
				valpesquisa.equalsIgnoreCase(" ") ||
				valpesquisa.equalsIgnoreCase(".") ||
				valpesquisa.length()<=2) {
			request.getRequestDispatcher("WEB-INF/jsps/valpesquisavazio.jsp").forward(request, response);
			System.out.println("vazio o campo informado");
		} else {
			try {
				UsuarioDao usdao = new UsuarioDao();
				System.out.println("busca:"+valpesquisa);
				//request.setAttribute("usuario_id_fb", usdao.listar(valpesquisa));
				request.setAttribute("usuario_nome_fb",usdao.listar(valpesquisa));
				request.setAttribute("usuario_username_fb",usdao.listar(valpesquisa));
				//request.setAttribute("ratio",usdao.listar(valpesquisa));
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsps/respesquisa.jsp");
				view.forward(request, response);

			} catch (Exception e) {
				request.setAttribute("msg", "Erro get: " + e.getMessage());
				request.getRequestDispatcher("WEB-INF/jsps/respesquisa.jsp").forward(request, response);
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