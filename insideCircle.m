function inCircle = insideCircle(pt, circle)
i = length(pt);
inCircle(1:i) = (sqrt((pt(1:i, 1)-circle(1)).^2+(pt(1:i, end)-circle(2)).^2))< circle(3);
inCircle = inCircle';
end
