{$, View, TextEditorView} = require "atom-space-pen-views"

module.exports =
class MarkdownReflinkView extends View

  REF_LINK_RE = /\[(.+?)\]\s?\[(\d+?)\]/
  REF_NOTE_RE = /^\[\d+?\]\s(.+)$/m

  addReflink: (text, href) ->
    @collectReflinks()

    label = @reflinks.length
    @editor.replaceSelected("[{$text}][{$label}]")
    @editor.append("[{$label}] {$href}\n")

    # TODO(seongjaelee): Update reflinks pos.

    @rewriteReflinks()

  collectReflinks: ->
    @reflinks = {}
    editor = atom.workspace.getActiveTextEditor()
    text = editor.getText()

    # Collect links.
    for match, i in REF_LINK_RE.findIter(text)
      # TODO(seongjae): We assume there are no overlapping labels. It should be
      # also implemented later.
      pos = i
      @reflinks[label] = {
        'pos': [pos], # TODO(seongjaelee): Let's rather use its position.
        'text': match[1],
        'label': match[2],
        'href': null
      }

    # Collect references. If there is a reference that does not contain its
    # corresponding link, don't count it.
    for match in REF_NOTE_RE.findIter(text)
      label = match[1]
      desc = match[2]
      if @reflinks.hasKey(label)
        @reflinks[label].href = href

  rewriteReflinks: ->
    # Delete all reference notes.
    text = editor.getText()
    text.sub(REF_NOTE_RE, '')

    # TODO(seongjaelee): If there is a link without its reference, we need to
    # delete its link... Or should we just add a warning? I donno.

    # TODO(seongjaelee): Make sure this is in a revere order. We want to modify
    # the text backward.
    links = links.getValues()
      .sort (x, y) -> x.pos < y.pos
      .filter (x, i) -> x.label = i
    for link in @reflinks
      text.sub(pos, REF_LINK_RE, /\[$1\]\[{$link.id}\]/)

    # TODO(seongjaelee): If there is no double line breaks at the end of the
    # document, add line breaks.
    # TODO(seongjaelee): If there are some other references at the end of the
    # document, then don't add line breaks.
    for link in @reflinks
      editor.append('[%s] %s\n' % (link.label, link.href))
