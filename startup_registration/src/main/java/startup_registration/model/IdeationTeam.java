package startup_registration.model;
import javax.persistence.*;
@Entity
@Table(name = "ideation_team")
public class IdeationTeam {

	@EmbeddedId
	private IdeationTeamId ideationTeamId; 
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ideanumber", referencedColumnName = "ideanumber", insertable = false, updatable = false)
	private IdeationTable ideationTable;

      @Column(name = "member_name")
	private String memberName;

	@Column(name = "member_email")
	private String memberEmail;

	@Column(name = "member_phone")
	private String memberPhone;

	@Column(name = "member_role")
	private String memberRole;
	
	public IdeationTeam(IdeationTeamId ideationTeamId, IdeationTable ideationTable, String memberName,
			String memberEmail, String memberPhone, String memberRole) {
		super();
		this.ideationTeamId = ideationTeamId;
		this.ideationTable = ideationTable;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberRole = memberRole;
	}

	public IdeationTable getIdeationTable() {
		return ideationTable;
	}

	public void setIdeationTable(IdeationTable ideationTable) {
		this.ideationTable = ideationTable;
	}

	public IdeationTeamId getIdeationTeamId() {
		return ideationTeamId;
	}

	public void setIdeationTeamId(IdeationTeamId ideationTeamId) {
		this.ideationTeamId = ideationTeamId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}

	public IdeationTeam() {
		super();
		// TODO Auto-generated constructor stub
	}

}
