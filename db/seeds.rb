@user = User.create(username: "test", name: "Test Firm", email: "test@test.com", password: "test")
@dev = Developer.create(name: "Millcreek Residential")
@proj = Project.create(name: "McKinney")
@proj.user = @user
@proj.developer = @dev
@proj.proj_type = "Multi-Family"
@proj.description = "This project is a 450+ unit, wrap-style apartment building. This is a high-density apartment build that  is wood-framed and 5 stories tall. Units are serviced with wall mounted FCUs and water is provided by a central water system."
@proj.save
