class Quizmodel {
    Quizmodel({
        required this.id,
        required this.name,
        required this.title,
        required this.description,
        required this.difficultyLevel,
        required this.topic,
        required this.time,
        required this.isPublished,
        required this.createdAt,
        required this.updatedAt,
        required this.duration,
        required this.endTime,
        required this.negativeMarks,
        required this.correctAnswerMarks,
        required this.shuffle,
        required this.showAnswers,
        required this.lockSolutions,
        required this.isForm,
        required this.showMasteryOption,
        required this.readingMaterial,
        required this.quizType,
        required this.isCustom,
        required this.bannerId,
        required this.examId,
        required this.showUnanswered,
        required this.endsAt,
        required this.lives,
        required this.liveCount,
        required this.coinCount,
        required this.questionsCount,
        required this.dailyDate,
        required this.maxMistakeCount,
        required this.readingMaterials,
        required this.questions,
        required this.progress,
    });

    final int? id;
    final dynamic name;
    final String? title;
    final String? description;
    final dynamic difficultyLevel;
    final String? topic;
    final DateTime? time;
    final bool? isPublished;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? duration;
    final DateTime? endTime;
    final String? negativeMarks;
    final String? correctAnswerMarks;
    final bool? shuffle;
    final bool? showAnswers;
    final bool? lockSolutions;
    final bool? isForm;
    final bool? showMasteryOption;
    final dynamic readingMaterial;
    final dynamic quizType;
    final bool? isCustom;
    final dynamic bannerId;
    final dynamic examId;
    final bool? showUnanswered;
    final DateTime? endsAt;
    final dynamic lives;
    final String? liveCount;
    final int? coinCount;
    final int? questionsCount;
    final String? dailyDate;
    final int? maxMistakeCount;
    final List<dynamic> readingMaterials;
    final List<Question> questions;
    final int? progress;

    factory Quizmodel.fromJson(Map<String, dynamic> json){ 
        return Quizmodel(
            id: json["id"],
            name: json["name"],
            title: json["title"],
            description: json["description"],
            difficultyLevel: json["difficulty_level"],
            topic: json["topic"],
            time: DateTime.tryParse(json["time"] ?? ""),
            isPublished: json["is_published"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            duration: json["duration"],
            endTime: DateTime.tryParse(json["end_time"] ?? ""),
            negativeMarks: json["negative_marks"],
            correctAnswerMarks: json["correct_answer_marks"],
            shuffle: json["shuffle"],
            showAnswers: json["show_answers"],
            lockSolutions: json["lock_solutions"],
            isForm: json["is_form"],
            showMasteryOption: json["show_mastery_option"],
            readingMaterial: json["reading_material"],
            quizType: json["quiz_type"],
            isCustom: json["is_custom"],
            bannerId: json["banner_id"],
            examId: json["exam_id"],
            showUnanswered: json["show_unanswered"],
            endsAt: DateTime.tryParse(json["ends_at"] ?? ""),
            lives: json["lives"],
            liveCount: json["live_count"],
            coinCount: json["coin_count"],
            questionsCount: json["questions_count"],
            dailyDate: json["daily_date"],
            maxMistakeCount: json["max_mistake_count"],
            readingMaterials: json["reading_materials"] == null ? [] : List<dynamic>.from(json["reading_materials"]!.map((x) => x)),
            questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
            progress: json["progress"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "description": description,
        "difficulty_level": difficultyLevel,
        "topic": topic,
        "time": time?.toIso8601String(),
        "is_published": isPublished,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "duration": duration,
        "end_time": endTime?.toIso8601String(),
        "negative_marks": negativeMarks,
        "correct_answer_marks": correctAnswerMarks,
        "shuffle": shuffle,
        "show_answers": showAnswers,
        "lock_solutions": lockSolutions,
        "is_form": isForm,
        "show_mastery_option": showMasteryOption,
        "reading_material": readingMaterial,
        "quiz_type": quizType,
        "is_custom": isCustom,
        "banner_id": bannerId,
        "exam_id": examId,
        "show_unanswered": showUnanswered,
        "ends_at": "${endsAt?.year.toString().padLeft(4,'0')}-${endsAt?.month.toString().padLeft(2,'0')}-${endsAt?.day.toString().padLeft(2,'0')}",
        "lives": lives,
        "live_count": liveCount,
        "coin_count": coinCount,
        "questions_count": questionsCount,
        "daily_date": dailyDate,
        "max_mistake_count": maxMistakeCount,
        "reading_materials": readingMaterials.map((x) => x).toList(),
        "questions": questions.map((x) => x?.toJson()).toList(),
        "progress": progress,
    };

}

class Question {
    Question({
        required this.id,
        required this.description,
        required this.difficultyLevel,
        required this.topic,
        required this.isPublished,
        required this.createdAt,
        required this.updatedAt,
        required this.detailedSolution,
        required this.type,
        required this.isMandatory,
        required this.showInFeed,
        required this.pyqLabel,
        required this.topicId,
        required this.readingMaterialId,
        required this.fixedAt,
        required this.fixSummary,
        required this.createdBy,
        required this.updatedBy,
        required this.quizLevel,
        required this.questionFrom,
        required this.language,
        required this.photoUrl,
        required this.photoSolutionUrl,
        required this.isSaved,
        required this.tag,
        required this.options,
        required this.readingMaterial,
    });

    final int? id;
    final String? description;
    final dynamic difficultyLevel;
    final String? topic;
    final bool? isPublished;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? detailedSolution;
    final String? type;
    final bool? isMandatory;
    final bool? showInFeed;
    final String? pyqLabel;
    final int? topicId;
    final int? readingMaterialId;
    final DateTime? fixedAt;
    final String? fixSummary;
    final dynamic createdBy;
    final String? updatedBy;
    final dynamic quizLevel;
    final String? questionFrom;
    final dynamic language;
    final dynamic photoUrl;
    final dynamic photoSolutionUrl;
    final bool? isSaved;
    final String? tag;
    final List<Option> options;
    final ReadingMaterial? readingMaterial;

    factory Question.fromJson(Map<String, dynamic> json){ 
        return Question(
            id: json["id"],
            description: json["description"],
            difficultyLevel: json["difficulty_level"],
            topic: json["topic"],
            isPublished: json["is_published"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            detailedSolution: json["detailed_solution"],
            type: json["type"],
            isMandatory: json["is_mandatory"],
            showInFeed: json["show_in_feed"],
            pyqLabel: json["pyq_label"],
            topicId: json["topic_id"],
            readingMaterialId: json["reading_material_id"],
            fixedAt: DateTime.tryParse(json["fixed_at"] ?? ""),
            fixSummary: json["fix_summary"],
            createdBy: json["created_by"],
            updatedBy: json["updated_by"],
            quizLevel: json["quiz_level"],
            questionFrom: json["question_from"],
            language: json["language"],
            photoUrl: json["photo_url"],
            photoSolutionUrl: json["photo_solution_url"],
            isSaved: json["is_saved"],
            tag: json["tag"],
            options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
            readingMaterial: json["reading_material"] == null ? null : ReadingMaterial.fromJson(json["reading_material"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "difficulty_level": difficultyLevel,
        "topic": topic,
        "is_published": isPublished,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "detailed_solution": detailedSolution,
        "type": type,
        "is_mandatory": isMandatory,
        "show_in_feed": showInFeed,
        "pyq_label": pyqLabel,
        "topic_id": topicId,
        "reading_material_id": readingMaterialId,
        "fixed_at": fixedAt?.toIso8601String(),
        "fix_summary": fixSummary,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "quiz_level": quizLevel,
        "question_from": questionFrom,
        "language": language,
        "photo_url": photoUrl,
        "photo_solution_url": photoSolutionUrl,
        "is_saved": isSaved,
        "tag": tag,
        "options": options.map((x) => x?.toJson()).toList(),
        "reading_material": readingMaterial?.toJson(),
    };

}

class Option {
    Option({
        required this.id,
        required this.description,
        required this.questionId,
        required this.isCorrect,
        required this.createdAt,
        required this.updatedAt,
        required this.unanswered,
        required this.photoUrl,
    });

    final int? id;
    final String? description;
    final int? questionId;
    final bool? isCorrect;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final bool? unanswered;
    final dynamic photoUrl;

    factory Option.fromJson(Map<String, dynamic> json){ 
        return Option(
            id: json["id"],
            description: json["description"],
            questionId: json["question_id"],
            isCorrect: json["is_correct"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            unanswered: json["unanswered"],
            photoUrl: json["photo_url"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "question_id": questionId,
        "is_correct": isCorrect,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "unanswered": unanswered,
        "photo_url": photoUrl,
    };

}

class ReadingMaterial {
    ReadingMaterial({
        required this.id,
        required this.keywords,
        required this.content,
        required this.createdAt,
        required this.updatedAt,
        required this.contentSections,
        required this.practiceMaterial,
    });

    final int? id;
    final String? keywords;
    final dynamic content;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<String> contentSections;
    final PracticeMaterial? practiceMaterial;

    factory ReadingMaterial.fromJson(Map<String, dynamic> json){ 
        return ReadingMaterial(
            id: json["id"],
            keywords: json["keywords"],
            content: json["content"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            contentSections: json["content_sections"] == null ? [] : List<String>.from(json["content_sections"]!.map((x) => x)),
            practiceMaterial: json["practice_material"] == null ? null : PracticeMaterial.fromJson(json["practice_material"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "keywords": keywords,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "content_sections": contentSections.map((x) => x).toList(),
        "practice_material": practiceMaterial?.toJson(),
    };

}

class PracticeMaterial {
    PracticeMaterial({
        required this.content,
        required this.keywords,
    });

    final List<String> content;
    final List<String> keywords;

    factory PracticeMaterial.fromJson(Map<String, dynamic> json){ 
        return PracticeMaterial(
            content: json["content"] == null ? [] : List<String>.from(json["content"]!.map((x) => x)),
            keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
        );
    }

    Map<String, dynamic> toJson() => {
        "content": content.map((x) => x).toList(),
        "keywords": keywords.map((x) => x).toList(),
    };

}
