function B = myLPF(A,w0_Fs,wc)
    N = (length(A)-1)/2;
    B = zeros(1,2*N+1);
    for k = -N:N
        if abs(k*w0_Fs)<=wc
            B(k+N+1) = A(k+N+1);
        end
    end
end