package com.lxf.bean;

public class Employee
{
  private Long associateId;
  private String birthDate;
  private String employmentDate;
  private String firstName;
  private String lastName;
  private String displayName;
  private Integer employType;
  private Integer personalStatus;

  public Long getAssociateId()
  {
    return this.associateId;
  }
  public void setAssociateId(Long associateId) {
    this.associateId = associateId;
  }
  public String getFirstName() {
    return this.firstName;
  }
  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }
  public String getDisplayName() {
    return this.displayName;
  }
  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }
  public Integer getEmployType() {
    return this.employType;
  }
  public void setEmployType(Integer employType) {
    this.employType = employType;
  }
  public Integer getPersonalStatus() {
    return this.personalStatus;
  }
  public void setPersonalStatus(Integer personalStatus) {
    this.personalStatus = personalStatus;
  }
  public String getBirthDate() {
    return this.birthDate;
  }
  public void setBirthDate(String birthDate) {
    this.birthDate = birthDate;
  }
  public String getEmploymentDate() {
    return this.employmentDate;
  }
  public void setEmploymentDate(String employmentDate) {
    this.employmentDate = employmentDate;
  }
  public String getLastName() {
    return this.lastName;
  }
  public void setLastName(String lastName) {
    this.lastName = lastName;
  }
}