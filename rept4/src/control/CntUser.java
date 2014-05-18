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
	//private UsuarioDao dao;

	public CntUser() {
		super();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	
				try {
					UsuarioDao usdao = new UsuarioDao();
					
					request.setAttribute("usuario_id_fb", usdao.listar());
					request.setAttribute("usuario_nome_fb", usdao.listar());
					request.setAttribute("usuario_username_fb", usdao.listar());
					RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsps/consulta.jsp");
					view.forward(request, response);
					
					 //RequestDispatcher view = request.getRequestDispatcher("DemoJSP.jsp");
				       // view.forward(request, response);
				} catch (Exception e) {
					request.setAttribute("msg", "Erro: " + e.getMessage());  
					request.getRequestDispatcher("WEB-INF/jsps/consulta.jsp").forward(request,response);  
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