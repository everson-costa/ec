package control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.UsuarioDao;

@WebServlet("/DesLaique")
public class DesLaique extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DesLaique() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	   }  
	  
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		   
	      try{
			UsuarioDao usdao;
			usdao = new UsuarioDao();
			String idpraDeslaique = request.getParameter("deslai");
			usdao.DesLaique(idpraDeslaique);
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsps/pagperfil.jsp?per="+idpraDeslaique);
			view.forward(request, response);
	      }catch (Exception e) {  
	          request.setAttribute("msg", "Erro: " + e.getMessage());  
	          request.getRequestDispatcher("WEB-INF/jsps/erro.jsp").forward(request,response);  
	       }  
	    }  
	 }