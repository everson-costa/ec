package control;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.UsuarioDao;

@WebServlet("/Laique")
public class Laique extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Laique() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	   }  
	  
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		   
	      try{
			UsuarioDao usdao;
			usdao = new UsuarioDao();
			//Long tempos = Long.parseLong(request.getParameter("num1"));
			String idpralaique = request.getParameter("laique");
			usdao.Laique(idpralaique);
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsps/pagperfil.jsp?per="+idpralaique);
			view.forward(request, response);
	      }catch (Exception e) {  
	          request.setAttribute("msg", "Erro: " + e.getMessage());  
	          request.getRequestDispatcher("WEB-INF/jsps/erro.jsp").forward(request,response);  
	       }  
	    }  
	 }