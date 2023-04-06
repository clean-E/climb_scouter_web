class Mutation {
  // createUser (mutation, 유저 생성)

  static final String createUser = """
	mutation(\$name: String!, \$password: String!){
	  createUser(name:\$name, password:\$password){
	    name
			records {
				date
				gym
				total
				problems {
					grade
					count
				}
			}
	  }
  }
""";

// getGymGrade (query, 암장의 grade를 가져올 때. 현재 theClimb과 thePlastic만 있음)

  static final String getGymGrade = """
	query(\$gymName: String!) {
		getGymGrade(gymName: \$gymName) {
			lv0
	    lv1
	    lv2
	    lv3
	    lv4
	    lv5
	    lv6
	    lv7
	    lv8
	    lv9
	    lv10
	    lv11
	    lv12
	    lv13
	    lv14
	    lv15
		}
	}
""";

// createRecord (mutation, 기록 생성)

  static final String createRecord = """
	mutation(\$record: CreateRecordInput!){
	  createRecord(record:\$record){
	    name
      records {
				date
				gym
				total
				problems {
					grade
					count
				}
			}
	  }
  }
""";

// CreateRecordInput: {
// 	name: string
// 	gym: string ('theClimb', 'thePlastic')
// 	problems: {
// 		grade: string
// 		count: number
// 	}
// }

// editRecord (mutation, 기록 수정)

  static final String editRecord = """
	mutation(\$record: EditRecordInput!){
	  editRecord(record:\$record){
	    name
      records {
				date
				gym
				total
				problems {
					grade
					count
				}
			}
	  }
  }
""";

// EditRecordInput: {
// 	id: string
// 	name: string
// 	password: string
// 	gym: string
// 	problems: {
// 		grade: string
// 		count: number
// 	}
// }

// deleteRecord (mutation, 기록 삭제)

  static final String deleteRecord = """
	mutation(\$id: String!, \$name: String!, \$password: String!){
	  deleteRecord(id:\$id, name:\$name, password:\$password){
	    name
			records {
				date
				gym
				total
				problems {
					grade
					count
				}
			}
	  }
  }
""";
}
