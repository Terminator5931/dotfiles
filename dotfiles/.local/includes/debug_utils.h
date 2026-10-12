#pragma once
#ifndef DEBUG_UTILS_H
#define DEBUG_UTILS_H

template <typename T>
void customPrint(const T& arg) {
  std::cout << arg;
}
template <typename T>
void customPrint(const std::vector<T>& arg) {
  std::cout << "[ ";
  for (size_t i = 0; i < arg.size(); i++) {
    customPrint(arg[i]);
    if (i < arg.size() - 1) std::cout << ", ";
  }
  std::cout << " ]";
}
template <typename T>
void customPrint(const std::vector<std::vector<T>>& arg) {
  std::cout << "[\n";
  for (size_t i = 0; i < arg.size(); i++) {
    std::cout << "  [ ";
    for (size_t j = 0; j < arg[i].size(); j++) {
      customPrint(arg[i][j]);
      if (j < arg[i].size() - 1) std::cout << ", ";
    }
    std::cout << " ]";
    if (i < arg.size() - 1) std::cout << ",";
    std::cout << "\n";
  }
  std::cout << "]";
}
// Variadic print - handles multiple args
template <typename... Args>
void print(Args... args) {
  ((customPrint(args), std::cout << " "), ...);
  std::cout << "\n";
}

#endif  // DEBUG_UTILS_H
