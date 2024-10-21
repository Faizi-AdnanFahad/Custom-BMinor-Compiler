#include "../include/expr.h"
#include <stdlib.h>

struct expr *expr_create(expr_t kind, struct expr *left, struct expr *right) {
  struct expr *e = malloc(sizeof(*e));
  e->kind = kind;
  e->literal_value = 0;
  e->left = left;
  e->right = right;
  return e;
}

struct expr *expr_create_value(int value, expr_t kind) {
  struct expr *e = expr_create(kind, 0, 0);
  e->literal_value = value;
  return e;
}
