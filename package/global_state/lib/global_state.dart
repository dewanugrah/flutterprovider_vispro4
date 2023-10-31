library global_state;

void incrementCounter(List<int> counters, int index) {
  counters[index]++;
}

void decrementCounter(List<int> counters, int index) {
  if (counters[index] > 0) {
    counters[index]--;
  }
}

void addNewCard(List<int> counters) {
  counters.add(0);
}

void removeCard(List<int> counters, int index) {
  counters.removeAt(index);
}