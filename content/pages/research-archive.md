---
title: "Research Archive"
layout: "single"
url: "/research-archive/"
---

## All Research Posts

{{ range (where site.RegularPages "Type" "posts") }}
- [{{ .Title }}]({{ .Permalink }}) — {{ .PublishDate.Format "January 2006" }}
{{ end }}