package startup_registration.model;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class IdeationTeamId implements Serializable {

	private static final long serialVersionUID = 1L;
	private int ideanumber;
     private int teamId;
   
	public int getIdeanumber() {
		return ideanumber;
	}
	public void setIdeanumber(int ideanumber) {
		this.ideanumber = ideanumber;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public IdeationTeamId(int ideanumber, int teamId) {
		super();
		this.ideanumber = ideanumber;
		this.teamId = teamId;
	}
	public IdeationTeamId() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    
}