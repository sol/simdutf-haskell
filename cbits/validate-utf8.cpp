#include "simdutf.h"
extern "C" {
  bool _hs_simdutf_validate_utf8(const char *payload, size_t offset, size_t length) noexcept {
    return simdutf::validate_utf8(payload + offset, length);
  }
}
