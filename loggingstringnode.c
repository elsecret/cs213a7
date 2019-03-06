#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "node.h"
#include "stringnode.h"
#include "loggingstringnode.h"

struct LoggingStringNode_class LoggingStringNode_class_table = {
  StringNode_compareTo,
  StringNode_printNode,
  LoggingStringNode_insert,
  Node_print,
  Node_delete,
};

void LoggingStringNode_ctor(void* thisv, char* s) {
  struct LoggingStringNode* this = thisv;
  // Bypassing StringNode_ctor
  Node_ctor(this);
  this->s = s;
}

void LoggingStringNode_insert(void* thisv, void* nodev) {
  printf("insert ");
  struct LoggingStringNode * node = nodev;
  printf(node->s);
  printf("\n");
  Node_insert(thisv, nodev);
  return;
}

void* new_LoggingStringNode(char* s) {
  struct LoggingStringNode* obj = malloc(sizeof(struct LoggingStringNode));
  obj->class = &LoggingStringNode_class_table;
  LoggingStringNode_ctor(obj, s);
  return obj;
}