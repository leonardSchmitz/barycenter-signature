module barycenter

using Oscar;

greet() = print("Hello World!")

include("typesetting.jl")
include("tensorOperations.jl")
include("FreeTruncSigAlgMultiv.jl")
include("TruncTensorSeq.jl")
include("matrixOperations.jl")


end # module barycenter
