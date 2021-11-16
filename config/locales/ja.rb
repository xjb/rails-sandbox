{
  ja: {
    i18n: {
      plural: {
        # keys: %i[zero one other],
        keys: %i[one other],
        rule: lambda do |n|
          case n
          # when 0 then :zero
          when 1 then :one
          else :other
          end
        end,
      },
    },
  },
}
