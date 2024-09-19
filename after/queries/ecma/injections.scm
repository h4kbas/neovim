; extends

(
  (string_fragment) @string_content @injection.content
  (#match? @string_content "--sql")
  (#set! injection.language "sql")
)
