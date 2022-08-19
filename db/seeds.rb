@user = User.create(username: "jdp", name: "Jones Diercks + Partners", email: "jdp@test.com", password: "test")
@dev1 = Developer.create(name: "Columbus Realty Partners")
@dev2 = Developer.create(name: "Mill Creek Residential")
@dev3 = Developer.create(name: "Rosewood Group")
@dev4 = Developer.create(name: "Billingsley Company")
Project.create(name: "Legacy West", user_id: @user.id, developer_id: @dev1.id, proj_type: "Mixed-Use", description: "This is a generic description of a development project.")
Project.create(name: "North Fields", user_id: @user.id, developer_id: @dev1.id, proj_type: "Mixed-Use", description: "This is a generic description of a development project.")
Project.create(name: "The Domaine", user_id: @user.id, developer_id: @dev2.id, proj_type: "Mixed-Use", description: "This is a generic description of a development project.")
Project.create(name: "Tobin Estates", user_id: @user.id, developer_id: @dev3.id, proj_type: "Multi-Family", description: "This is a generic description of a development project.")
Project.create(name: "Hastings End", user_id: @user.id, developer_id: @dev4.id, proj_type: "Multi-Family", description: "This is a generic description of a development project.")

@oppuser = User.create(username: "opp", name: "Opp Firm", email: "opp@test.com", password: "test")
@oppdev = Developer.create(name: "Opp Developer")
Project.create(name: "Hillcrest Estates", user_id: @oppuser.id, developer_id: @oppdev.id, proj_type: "Single-Family", description: "This is a generic description of a development project.")