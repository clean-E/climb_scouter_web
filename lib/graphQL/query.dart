class MyQuery {
  // getUser (query, 유저 기록들을 가져올 때)

  static final String getUser = """
	query(\$id: String!) {
	  getUser(id: \$id) {
	    name
      records {
        _id
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

// getPowerRank (query, 전투력 랭킹)
  static final String getPowerRank = """
	query {
		getPowerRank {
      _id
			name
			power
		}
	}
""";

// getGymGrade (query, 암장의 grade 가져옴)
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
}
