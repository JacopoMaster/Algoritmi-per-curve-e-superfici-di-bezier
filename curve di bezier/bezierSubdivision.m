% bezierSubdivision.m

function [leftCurve, rightCurve] = bezierSubdivision(controlPoints, t)
    n = size(controlPoints, 1) - 1;
    tempPoints = controlPoints;
    leftCurve = zeros(n + 1, 2);
    rightCurve = zeros(n + 1, 2);

    leftCurve(1, :) = controlPoints(1, :);
    rightCurve(end, :) = controlPoints(end, :);

    for r = 1:n
        for i = 1:(n - r + 1)
            tempPoints(i, :) = (1 - t) * tempPoints(i, :) + t * tempPoints(i + 1, :);
        end
        leftCurve(r + 1, :) = tempPoints(1, :);
        rightCurve(end - r, :) = tempPoints(n - r + 1, :);
    end
end
