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
			UsuarioDao usdao;

			if (cmd.equalsIgnoreCase("cadastrar")) {
				
				String usidfb = request.getParameter("usuario_id_fb");
				String nome_fb = request.getParameter("usuario_nome_fb");
				String username_fb = request.getParameter("usuario_username_fb");
				
				u = new Usuario(usidfb, nome_fb,username_fb);
				usdao = new UsuarioDao();
				
				usdao.create(u);

				if(usdao.checaIDrepet()){
					request.setAttribute("lnkperfil", "visitar: <a href="+request.getContextPath()+"/LoadProfile?loadperfil="+usidfb+">["+nome_fb+"]</a>.");
					request.getRequestDispatcher("WEB-INF/jsps/erroidrepetiu.jsp").forward(request,response);
				}else{
					request.setAttribute("msg", "Usuário: ["+nome_fb+"] criado com sucesso! \\o/ ");
					request.getRequestDispatcher("WEB-INF/jsps/index.jsp").forward(request,response);
				}
			}

	      }catch (Exception e) {  
	          request.setAttribute("msg", "Erro: " + e.getMessage());  
	          request.getRequestDispatcher("WEB-INF/jsps/index.jsp").forward(request,response);  
	       }  
	    }  
	 }