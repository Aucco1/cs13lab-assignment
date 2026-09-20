#include <iostream>
#include <string>
#include <vector>

extern "C" int process_dfa_1(const char* input);
extern "C" int process_dfa_2(const char* input);

int main() {
    std::vector<std::string> test_case_1 = {
        "000100", 
        "100000", 
        "010100", 
        "100011"
    };

    std::cout << "1.\n";
    for (const std::string& input_text : test_case_1) {
        if (process_dfa_1(input_text.c_str()) == 1) {
            std::cout << input_text << " -> Input Accepted\n";
        } else {
            std::cout << input_text << " -> Input Rejected\n";
        }
    }

    std::vector<std::string> test_case_2 = {
        "001001011", 
        "101110011",
        "011101001", 
        "110100111"
    };

    std::cout << "\n2.\n";
    for (const std::string& input_text : test_case_2) {
        if (process_dfa_2(input_text.c_str()) == 1) {
            std::cout << input_text << " -> Input Accepted\n";
        } else {
            std::cout << input_text << " -> Input Rejected\n";
        }
    }

    return 0;
}