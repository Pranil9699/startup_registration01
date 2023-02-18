package startup_registration.model;
import javax.persistence.*;
import java.util.*;
@Entity
@Table(name = "ideation_table")
public class IdeationTable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ideanumber")
    private int ideanumber;

    @Column(name = "date_time")
    private Date date_time;

    @Column(name = "startupname")
    private String startupname;

    @Column(name = "studentname")
    private String studentname;

    @Column(name = "collegename")
    private String collegename;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "painpoint")
    private String painpoint;

    @Column(name = "solution")
    private String solution;

    @Column(name = "prototypestatus")
    private String prototypestatus;

    @Column(name = "technology_knowhow")
    private String technology_knowhow;

    @Column(name = "skills_to_acquire")
    private String skills_to_acquire;

    @Column(name = "hobbies")
    private String hobbies;

    @Column(name = "college_mentor")
    private String college_mentor;
    
    @Column(name = "teamsize")
    private int teamsize;
    
    @Column(name = "fileupload_presentation")
    private String fileupload_presentation;

    @Column(name = "team_photo_upload")
    private String team_photo_upload;

    

    
	public int getIdeanumber() {
		return ideanumber;
	}

	public void setIdeanumber(int ideanumber) {
		this.ideanumber = ideanumber;
	}

	public Date getDate_time() {
		return date_time;
	}

	public void setDate_time(Date date_time) {
		this.date_time = date_time;
	}

	public String getStartupname() {
		return startupname;
	}

	public void setStartupname(String startupname) {
		this.startupname = startupname;
	}

	public String getStudentname() {
		return studentname;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}

	public String getCollegename() {
		return collegename;
	}

	public void setCollegename(String collegename) {
		this.collegename = collegename;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPainpoint() {
		return painpoint;
	}

	public void setPainpoint(String painpoint) {
		this.painpoint = painpoint;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	public String getPrototypestatus() {
		return prototypestatus;
	}

	public void setPrototypestatus(String prototypestatus) {
		this.prototypestatus = prototypestatus;
	}

	public String getTechnology_knowhow() {
		return technology_knowhow;
	}

	public void setTechnology_knowhow(String technology_knowhow) {
		this.technology_knowhow = technology_knowhow;
	}

	public String getSkills_to_acquire() {
		return skills_to_acquire;
	}

	public void setSkills_to_acquire(String skills_to_acquire) {
		this.skills_to_acquire = skills_to_acquire;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public String getCollege_mentor() {
		return college_mentor;
	}

	public void setCollege_mentor(String college_mentor) {
		this.college_mentor = college_mentor;
	}

	public int getTeamsize() {
		return teamsize;
	}

	public void setTeamsize(int teamsize) {
		this.teamsize = teamsize;
	}

	public String getFileupload_presentation() {
		return fileupload_presentation;
	}

	public void setFileupload_presentation(String fileupload_presentation) {
		this.fileupload_presentation = fileupload_presentation;
	}

	public String getTeam_photo_upload() {
		return team_photo_upload;
	}

	public void setTeam_photo_upload(String team_photo_upload) {
		this.team_photo_upload = team_photo_upload;
	}

	
	public IdeationTable(int ideanumber, Date date_time, String startupname, String studentname, String collegename,
			String email, String phone, String painpoint, String solution, String prototypestatus,
			String technology_knowhow, String skills_to_acquire, String hobbies, String college_mentor, int teamsize,
			String fileupload_presentation, String team_photo_upload) {
		super();
		this.ideanumber = ideanumber;
		this.date_time = date_time;
		this.startupname = startupname;
		this.studentname = studentname;
		this.collegename = collegename;
		this.email = email;
		this.phone = phone;
		this.painpoint = painpoint;
		this.solution = solution;
		this.prototypestatus = prototypestatus;
		this.technology_knowhow = technology_knowhow;
		this.skills_to_acquire = skills_to_acquire;
		this.hobbies = hobbies;
		this.college_mentor = college_mentor;
		this.teamsize = teamsize;
		this.fileupload_presentation = fileupload_presentation;
		this.team_photo_upload = team_photo_upload;
	}

	public IdeationTable() {
		super();
		// TODO Auto-generated constructor stub
	}
}