#include "simdutf.h"
extern "C" {
  bool _hs_simdutf_validate_utf8(const char *arr, size_t off, size_t len) noexcept {
    return simdutf::validate_utf8(arr + off, len);
  }

  size_t _hs_simdutf_count_utf8(const char *arr, size_t off, size_t len) noexcept {
    return simdutf::count_utf8(arr + off, len);
  }
}
