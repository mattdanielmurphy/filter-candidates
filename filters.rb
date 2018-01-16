require './candidates'


def find(id)
  @candidates.each do |cand|
    return cand if cand[:id] == id
  end
  nil
end

def experienced?(cand)
  return true if cand[:years_of_experience] > 1
  false
end

def knows_ruby_or_python?(cand)
  if ( cand[:languages] & ['Ruby', 'Python'] ).present?
    return true
  end
  false
end

def applied_recently?(cand)
  return true if (Date.today - cand[:date_applied]) < 16
  false
end

def criteria_met?(cand)
  if (
      experienced?(cand) &&
      cand[:github_points] > 99 &&
      knows_ruby_or_python?(cand) &&
      applied_recently?(cand) &&
      cand[:age] > 17
    )
    return true
  end
  false
end

def qualified_candidates(cands)
  cands.select { |cand| criteria_met?(cand) }
end

def ordered_by_qualifications(cands)
  cands.sort_by{ |cand| [
                          cand[:years_of_experience],
                          cand[:github_points]
                        ]}.reverse
end