import './stack.dart';
import './linked_list.dart';
import 'dart:io';
void main(){
  // you can test the 6 functions (challenges) here
}

// Challenge 1
void printListInReverse(List list){
  final stack = Stack.of(list);
  while(stack.isNotEmpty){
    stdout.write(stack.pop() + ' ');
  }
  print('');
}

// Challenge 2
bool balancedParentheses(String text){
  final stack = Stack<String>();
  for(String ch in text.split('')){
    if(ch == '('){
      stack.push(ch);
    }
    if(ch == ')'){
      if(stack.isEmpty) return false;
      stack.pop();
    }
  }
  return stack.isEmpty;
}

// Challenge 3
void printInReverse(Node? node) {
  if (node == null) {
    return;
  }
  printInReverse(node.next);
  print(node.value);
}

// Challenge 4
Node<E>? findMiddle<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;

  while (fast?.next != null) {
    slow = slow?.next;
    fast = fast?.next?.next;
  }

  return slow;
}

// Challenge 5
void reverseLinkedList<E>(LinkedList<E> list) {
  Node<E>? prev = null;
  var current = list.head;
  list.tail = list.head;

  while (current != null) {
    final next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }

  list.head = prev;
}

// Challenge 6
void removeAllOccurrences<E>(LinkedList<E> list, E value) {
  while (list.head != null && list.head?.value == value) {
    list.head = list.head?.next;
  }

  var current = list.head;

  while (current?.next != null) {
    if (current!.next!.value == value) {
      current.next = current.next!.next;
    } else {
      current = current.next;
    }
  }

  if (list.tail?.value == value) {
    list.tail = current;
  }
}