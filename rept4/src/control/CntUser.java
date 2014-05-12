package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.crypto.provider.RSACipher;

import persistence.UsuarioDao;

import model.Usuario;

@WebServlet("/CntUser")
public class CntUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CntUser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	
		String cmd = request.getParameter("cmd");
		Usuario u;
		UsuarioDao pd;

		if (cmd.equalsIgnoreCase("cnt")) {
			
			//String id_fb = request.getParameter("usuario_id_fb");
			//String nome_fb = request.getParameter("usuario_nome_fb");
			//String username_fb = request.getParameter("usuario_username_fb");
			
							
			//request.setAttribute("msg", "Usuário: ["+nome_fb+"] criado com sucesso! \\o/ ");
			//request.getRequestDispatcher("WEB-INF/jsps/index.jsp").forward(request,response);
		}
	
	}  
	  
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	      try{ 

		

	      }catch (Exception e) {  
	          request.setAttribute("msg", "Erro: " + e.getMessage());  
	          request.getRequestDispatcher("WEB-INF/jsps/index.jsp").forward(request,response);  
	       }  
	    }  
	 }