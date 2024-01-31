import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    
    // The two numbers the user must add
    @State private var firstNumber = Int.random(in: 1...25)
    @State private var secondNumber = Int.random(in: 1...25)
    
    // User input through TextField
    @State private var givenInput = ""
    
    // MARK: Computed properties
    
    // The correct sum of the randomly generated numbers
    var correctSum: Int {
        return firstNumber + secondNumber
    }
    
    // Feedback to the user
    @State private var feedback = ""
    
    // The user interface
    var body: some View {
        
        VStack(spacing: 10) {
            
            Spacer()
            
            HStack {
                Spacer()
                Text("\(firstNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
            
            HStack {
                Text("+")
                    .font(Font.system(size: 50))
                Spacer()
                Text("\(secondNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
                        
            Divider()
            
            HStack {
                Spacer()
                
                TextField("Enter your answer", text: $givenInput)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .frame(width: 150, height: 40)
                
            }
            
            Spacer()
            
            Button {
                checkAnswer()
            } label: {
                Text("Check Answer")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Text(feedback)
                .font(
                    .custom(
                        "BradleyHandITCTT-Bold",
                        size: 24.0,
                        relativeTo: .title3
                    )
                )
            
            Spacer()
            
            Button {
                reset()
            } label: {
                Text("Reset")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
    
    // MARK: Functions
    
    // Check whether the user's answer was correct
    // Provide appropriate feedback
    func checkAnswer() {
        guard let userAnswer = Int(givenInput) else {
            feedback = "Please enter a valid number."
            return
        }
        
        if userAnswer == correctSum {
            feedback = "Correct!"
        } else {
            feedback = "Incorrect. Try again."
        }
    }
    
    // Reset for a new question
    func reset() {
        firstNumber = Int.random(in: 1...25)
        secondNumber = Int.random(in: 1...25)
        givenInput = ""
        feedback = ""
    }
}

#Preview {
    AdditionView()
}

