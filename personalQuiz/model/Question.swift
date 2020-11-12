

struct Question {
    
    var text: String
    var type: ResponseType
    var answers: [Answer]
   
}


extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(text: "Какую пищу вы предпочитаете?", type: .single, answers: [
                Answer(text: "Стейк", type: .dog),
                Answer(text: "Рыба", type: .cat),
                Answer(text: "Морковь", type: .rabbit),
                Answer(text: "Кукуруза", type: .turtle)
            ]
            ),
            Question(text: "  Что Вам нравится больше?", type: .multiple, answers: [
                Answer(text: "Гулять", type: .dog),
                Answer(text: "Спать", type: .cat),
                Answer(text: "Обниматься", type: .rabbit),
                Answer(text: "Плавать", type: .turtle)
        ]
        ),
            Question(text: "Любите ли ВЫ поездки на машине", type: .ranged, answers: [
                Answer(text: "обожаю", type: .dog),
                Answer(text: "Ненавижу", type: .cat),
                Answer(text: "Незамичаю", type: .rabbit),
                Answer(text: "Нелюблю", type: .turtle)
        ]
        )
        ]
    }
}

