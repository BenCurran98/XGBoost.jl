
struct XGBoostError <: Exception
    caller
    message::String
end

"""
    xgbcall(𝒻, a...)

Call xgboost library function `𝒻` on arguments `a` properly handling errors.
"""
function xgbcall(𝒻, a...)
    err = 𝒻(a...)
    if err ≠ 0
        msg = unsafe_string(XGBGetLastError())
        throw(XGBoostError(𝒻, msg))
    end
    err
end

export XGBoostError, xgbcall
