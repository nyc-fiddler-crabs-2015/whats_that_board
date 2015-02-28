user1 = User.create(name: "Daniel", password: "123", phase: "2")
user2 = User.create(name: "Justin", password: "123", phase: "2")
user3 = User.create(name: "Leo", password: "123", phase: "2")
user4 = User.create(name: "Chris", password: "123", phase: "2")


topic1 = Topic.create(category: "Phase 1 / Week 1" , title: "Algorithms")
topic2 = Topic.create(category: "Phase 1 / Week 2" , title: "OO Design")
topic3 = Topic.create(category: "Phase 2 / Week 1" , title: "RESTful Routes")


Timeslot.create(time: "10 AM", student_id: user2.id, tutor_id: user1.id, topic_id: topic3.id)
Timeslot.create(time: "11 AM", student_id: user2.id, tutor_id: user1.id, topic_id: topic3.id)
Timeslot.create(time: "12 PM", student_id: user2.id, tutor_id: user1.id, topic_id: topic3.id)
Timeslot.create(time: "1 PM", student_id: user3.id, tutor_id: user1.id, topic_id: topic3.id)
Timeslot.create(time: "2 PM", student_id: user3.id, tutor_id: user1.id, topic_id: topic3.id)
Timeslot.create(time: "3 PM", student_id: user3.id, tutor_id: user1.id, topic_id: topic3.id)
Timeslot.create(time: "4 PM", student_id: user4.id, tutor_id: user1.id, topic_id: topic3.id)
Timeslot.create(time: "5 PM", student_id: user4.id, tutor_id: user1.id, topic_id: topic3.id)




