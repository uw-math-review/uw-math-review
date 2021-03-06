%% Computes the proper order of the adjacent cells for non-boundary points
% 
% Based off the search method implemented, the adjacent triangles are
% merely given and not necessarily in any order. This solves that by
% looking for the matching normals.
%
%
% adj has the same structure as EdgeMatrix and is called as adj(j,i)
% 
% add more documentation
%%

function order= order_triangles_b(current_tri,adj,t)
    order=zeros(1,3);    
    %ensures that the boundary term is always at the first position
    AdjTriLabel=sort(adj(1:3,current_tri));
    AdjTriVertex=[[0 ;0; 0], t(1:3,AdjTriLabel(2)),t(1:3,AdjTriLabel(3))];
    CurrentTriVertex=t(1:3,current_tri);
    Edge1=[CurrentTriVertex(1),CurrentTriVertex(2)];
    Edge2=[CurrentTriVertex(2),CurrentTriVertex(3)];
    Edge3=[CurrentTriVertex(3),CurrentTriVertex(1)];
    Edge=[Edge1 ; Edge2 ; Edge3];
    %loop over each edge
    for i=1:3
        CurrentEdge=Edge(i,:);     
        for j=1:3
            for k=1:3
                    if(CurrentEdge(1)==AdjTriVertex(k,j))
                        if(CurrentEdge(2)==AdjTriVertex(1,j) || CurrentEdge(2)==AdjTriVertex(2,j) || CurrentEdge(2)==AdjTriVertex(3,j))
                            order(i)=AdjTriLabel(j);
                        end
                    end
            end
        end
    end
end

