function path = get_bags_path()
    proj = currentProject;
    path = fullfile(proj.RootFolder, 'bags');
end