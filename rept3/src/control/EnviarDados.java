package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.UsuarioDao;

import model.Usuario;

@WebServlet("/EnviarDados")
public class EnviarDados extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EnviarDados() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	   }  
	  
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	      try{ 

			String cmd = request.getParameter("cmd");
			Usuario u;
			UsuarioDao pd;

			if (cmd.equalsIgnoreCase("cadastrar")) {
				
				String id_fb = request.getParameter("usuario_id_fb");
				String nome_fb = request.getParameter("usuario_nome_fb");
				String username_fb = request.getParameter("usuario_username_fb");
				
				u = new Usuario(id_fb, nome_fb, username_fb);

				pd = new UsuarioDao();
				pd.create(u);

				request.setAttribute("msg", "Usuário: ["+nome_fb+"] criado com sucesso! \\o/ ");
				request.getRequestDispatcher("index.jsp").forward(request,response);
			}

	      }catch (Exception e) {  
	          request.setAttribute("msg", "Erro: " + e.getMessage());  
	          request.getRequestDispatcher("index.jsp").forward(request,response);  
	       }  
	    }  
	 }