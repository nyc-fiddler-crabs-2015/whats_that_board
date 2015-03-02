user1 = User.create(name: "Daniel", password: "123", phase: "2")
user2 = User.create(name: "Justin", password: "123", phase: "2")
user3 = User.create(name: "Leo", password: "123", phase: "2")
user4 = User.create(name: "Chris", password: "123", phase: "2")


topic1 = Topic.create(category: "Phase 1 / Week 1" , title: "Algorithms")
topic2 = Topic.create(category: "Phase 1 / Week 2" , title: "OO Design")
topic3 = Topic.create(category: "Phase 2 / Week 1" , title: "RESTful Routes")


Timeslot.create(time: "10 AM", student: user2, tutor: user1, topic: topic3)
Timeslot.create(time: "11 AM", student: user2, tutor: user1, topic: topic3)
Timeslot.create(time: "12 PM", student: user2, tutor: user1, topic: topic3)
Timeslot.create(time: "1 PM", student: user3, tutor: user1, topic: topic3)
Timeslot.create(time: "2 PM", student: user3, tutor: user1, topic: topic3)
Timeslot.create(time: "3 PM", student: user3, tutor: user1, topic: topic3)
Timeslot.create(time: "4 PM", student: user4, tutor: user1, topic: topic3)
Timeslot.create(time: "5 PM", student: user4, tutor: user1, topic: topic3)

Timeslot.create(time: "10 AM", student: user2, tutor: user2, topic: topic3)
Timeslot.create(time: "11 AM", student: user2, tutor: user2, topic: topic3)
Timeslot.create(time: "12 PM", student: user2, tutor: user2, topic: topic3)
Timeslot.create(time: "1 PM", student: user3, tutor: user2, topic: topic3)
Timeslot.create(time: "2 PM", student: user3, tutor: user2, topic: topic3)
Timeslot.create(time: "3 PM", student: user3, tutor: user2, topic: topic3)
Timeslot.create(time: "4 PM", student: user4, tutor: user2, topic: topic3)
Timeslot.create(time: "5 PM", student: user4, tutor: user2, topic: topic3)

Feedback.create(content: "first feedback", user: user1)
Feedback.create(content: "second feedback", user: user1)




