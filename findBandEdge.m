function bandEdge = findBandEdge(p, bandNumber, edge)
%FINDBANDEDGE find the edge of a band

switch edge
    case 'top'
        bandEdge = pi*bandNumber;
        return
    case 'bottom'
        switch mod(bandNumber, 2)
            case 0
                offset = 1;
            case 1
                offset = -1;
        end
    otherwise
        raise exception
end

bandEdge = solve(charEqu(p, offset), pi*(bandNumber - 1) + 0.1, pi*(bandNumber));

end

