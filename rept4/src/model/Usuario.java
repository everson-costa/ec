package model;

public class Usuario {
	private String usuario_id_fb;
	private String usuario_nome_fb;
	private String usuario_username_fb;
	private float ratio;
	

	public Usuario(String usuario_id_fb,String usuario_nome_fb,String usuario_username_fb) {
		super();
		this.usuario_id_fb = usuario_id_fb;
		this.usuario_nome_fb = usuario_nome_fb;
		this.usuario_username_fb = usuario_username_fb;
		//this.ratio = ratio;
	}

	public Usuario() {
		super();
	}

//	public int getUsuario_id() {
//		return usuario_id;
//	}

//	public void setUsuario_id(int usuario_id) {
//		this.usuario_id = usuario_id;
//	}

	public String getUsuario_id_fb() {
		return usuario_id_fb;
	}

	public void setUsuario_id_fb(String usuario_id_fb) {
		this.usuario_id_fb = usuario_id_fb;
	}

	public String getUsuario_nome_fb() {
		return usuario_nome_fb;
	}

	public void setUsuario_nome_fb(String usuario_nome_fb) {
		this.usuario_nome_fb = usuario_nome_fb;
	}

	public String getUsuario_username_fb() {
		return usuario_username_fb;
	}

	public void setUsuario_username_fb(String usuario_username_fb) {
		this.usuario_username_fb = usuario_username_fb;
	}
	
	public float getRatio() {
		return ratio;
	}

	public void setRatio(float ratio) {
		this.ratio = ratio;
	}
	
//	  @Override  
//	    public String toString() {  
//	        return "Usuario [idFb=" + usuario_id_fb + ", nome=" + usuario_nome_fb+ ", username=" + usuario_username_fb+"]";  
//	    }  
	}  




