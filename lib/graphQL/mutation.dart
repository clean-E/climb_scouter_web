class MyMutation {
  // createUser (mutation, 유저 생성)

  static final String createUser = """
	mutation(\$name: String!, \$password: String!){
	  createUser(name:\$name, password:\$password){
	    name
			
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
