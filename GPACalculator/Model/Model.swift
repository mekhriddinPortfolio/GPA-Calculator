//
//  Model.swift
//  GPACalculator
//
//  Created by Mekhriddin Jumaev on 04/02/23.
//

import Foundation

struct SemesterModel: Equatable {
    let key: Int
    let name: String
    let gpa: Double?
    let credits: Int?
    var isMarked: Bool?
}

var selectedSemesters = [SemesterModel]()

var allsemesters = [
    SemesterModel(key: 1, name: "Semester 1", gpa: nil, credits: nil, isMarked: false),
    SemesterModel(key: 2, name: "Semester 2", gpa: nil, credits: nil, isMarked: false),
    SemesterModel(key: 3, name: "Semester 3", gpa: nil, credits: nil, isMarked: false),
    SemesterModel(key: 4, name: "Semester 4", gpa: nil, credits: nil, isMarked: false),
    SemesterModel(key: 5, name: "Semester 5", gpa: nil, credits: nil, isMarked: false),
    SemesterModel(key: 6, name: "Semester 6", gpa: nil, credits: nil, isMarked: false),
    SemesterModel(key: 7, name: "Semester 7", gpa: nil, credits: nil, isMarked: false),
    SemesterModel(key: 8, name: "Semester 8", gpa: nil, credits: nil, isMarked: false),
]

struct Grade {
    let name: String
    let scale: Double
}

let grades = [
    Grade(name: "A +", scale: 4.5),
    Grade(name: "A0", scale: 4.0),
    Grade(name: "B +", scale: 3.5),
    Grade(name: "B0", scale: 3.0),
    Grade(name: "C +", scale: 2.5),
    Grade(name: "C0", scale: 2.0),
    Grade(name: "D +", scale: 1.5),
    Grade(name: "D0", scale: 1.0),
    Grade(name: "F", scale: 0.0),
    Grade(name: "GPA", scale: 0.0),
]

let gradeDict: [String: Int] = ["A +": 0, "A0": 1, "B +": 2, "B0": 3, "C +": 4, "C0": 5, "D +": 6, "D0": 7, "F": 8, "GPA": 9]

struct SubjectModel {
    let name: String
    let grade: String
    let credits: Int
    let scale: Double
}

let universities = ["Inha university in Tashkent", "WIUT", "Tashkent Finance Institute", "TUIT"]
let subjects: [Int: [[SubjectModel]]] = [0: [
    [
    SubjectModel(name: "Academic English Reading", grade: "GPA", credits: 2, scale: 0.0),
    SubjectModel(name: "Academic English 1", grade: "GPA", credits: 2, scale: 0.0),
    SubjectModel(name: "Calculus 1", grade: "GPA", credits: 3, scale: 0.0),
    SubjectModel(name: "Physics 1", grade: "GPA", credits: 3, scale: 0.0),
    SubjectModel(name: "Physics Experiment 1", grade: "GPA", credits: 1, scale: 0.0),
    SubjectModel(name: "Object Oriented Programming 1", grade: "GPA", credits: 3, scale: 0.0),
    SubjectModel(name: " Introduction to IT", grade: "GPA", credits: 3, scale: 0.0),
    ],
    
    [
    SubjectModel(name: "Academic English Reading", grade: "GPA", credits: 2, scale: 0.0),
    SubjectModel(name: "Academic English 1", grade: "GPA", credits: 2, scale: 0.0),
    SubjectModel(name: "Calculus 1", grade: "GPA", credits: 3, scale: 0.0),
    SubjectModel(name: "Physics 1", grade: "GPA", credits: 3, scale: 0.0),
    SubjectModel(name: "Physics Experiment 1", grade: "GPA", credits: 1, scale: 0.0),
    SubjectModel(name: "Object Oriented Programming 1", grade: "GPA", credits: 3, scale: 0.0),
    SubjectModel(name: " Introduction to IT", grade: "GPA", credits: 3, scale: 0.0),
    ],
    
    
],
   
]
